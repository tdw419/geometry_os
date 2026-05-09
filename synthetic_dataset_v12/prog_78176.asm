; DESCRIPTION: Places a blue 24x35 rectangle at position (243, 178).
; PLAN: r0=243(x), r1=178(y), r2=24(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 178
LDI r2, 24
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
