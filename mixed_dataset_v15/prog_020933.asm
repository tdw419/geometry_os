; DESCRIPTION: Renders a cyan box of size 20x76 starting at (404, 96).
; PLAN: r0=404(x), r1=96(y), r2=20(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 96
LDI r2, 20
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
