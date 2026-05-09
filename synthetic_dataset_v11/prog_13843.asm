; DESCRIPTION: Renders a cyan box of size 81x64 starting at (117, 104).
; PLAN: r0=117(x), r1=104(y), r2=81(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 104
LDI r2, 81
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
