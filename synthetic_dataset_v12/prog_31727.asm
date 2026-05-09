; DESCRIPTION: Places a green 27x22 rectangle at position (29, 132).
; PLAN: r0=29(x), r1=132(y), r2=27(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 132
LDI r2, 27
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
