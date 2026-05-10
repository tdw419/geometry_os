; DESCRIPTION: Places a blue 33x80 rectangle at position (393, 107).
; PLAN: r0=393(x), r1=107(y), r2=33(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 107
LDI r2, 33
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
