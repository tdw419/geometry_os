; DESCRIPTION: Places a blue 39x38 rectangle at position (470, 193).
; PLAN: r0=470(x), r1=193(y), r2=39(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 193
LDI r2, 39
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
