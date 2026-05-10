; DESCRIPTION: Places a blue 22x120 rectangle at position (243, 105).
; PLAN: r0=243(x), r1=105(y), r2=22(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 105
LDI r2, 22
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
