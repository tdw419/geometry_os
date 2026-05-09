; DESCRIPTION: Renders a cyan box of size 104x57 starting at (96, 50).
; PLAN: r0=96(x), r1=50(y), r2=104(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 50
LDI r2, 104
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
