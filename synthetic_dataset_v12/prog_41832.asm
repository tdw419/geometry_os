; DESCRIPTION: Renders a cyan box of size 104x32 starting at (43, 105).
; PLAN: r0=43(x), r1=105(y), r2=104(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 105
LDI r2, 104
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
