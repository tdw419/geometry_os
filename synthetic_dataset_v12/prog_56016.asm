; DESCRIPTION: Places a yellow 99x64 rectangle at position (198, 167).
; PLAN: r0=198(x), r1=167(y), r2=99(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 167
LDI r2, 99
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
