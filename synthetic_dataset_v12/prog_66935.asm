; DESCRIPTION: Places a blue 96x48 rectangle at position (243, 172).
; PLAN: r0=243(x), r1=172(y), r2=96(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 172
LDI r2, 96
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
