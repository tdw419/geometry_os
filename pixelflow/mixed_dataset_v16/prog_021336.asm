; DESCRIPTION: Places a green 73x48 rectangle at position (432, 14).
; PLAN: r0=432(x), r1=14(y), r2=73(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 14
LDI r2, 73
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
