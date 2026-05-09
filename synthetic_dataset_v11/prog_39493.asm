; DESCRIPTION: Places a green 52x73 rectangle at position (142, 182).
; PLAN: r0=142(x), r1=182(y), r2=52(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 182
LDI r2, 52
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
