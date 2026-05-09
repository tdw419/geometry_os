; DESCRIPTION: Renders a cyan box of size 60x104 starting at (108, 16).
; PLAN: r0=108(x), r1=16(y), r2=60(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 16
LDI r2, 60
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
