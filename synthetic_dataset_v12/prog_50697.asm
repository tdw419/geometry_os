; DESCRIPTION: Places a green 95x31 rectangle at position (191, 107).
; PLAN: r0=191(x), r1=107(y), r2=95(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 107
LDI r2, 95
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
