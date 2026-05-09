; DESCRIPTION: Places a blue 38x21 rectangle at position (180, 86).
; PLAN: r0=180(x), r1=86(y), r2=38(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 86
LDI r2, 38
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
