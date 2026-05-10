; DESCRIPTION: Places a yellow 63x68 box at position (271, 120).
; PLAN: r0=271(x), r1=120(y), r2=63(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 120
LDI r2, 63
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
