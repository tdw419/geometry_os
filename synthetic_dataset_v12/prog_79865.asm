; DESCRIPTION: Places a green 33x90 rectangle at position (180, 24).
; PLAN: r0=180(x), r1=24(y), r2=33(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 24
LDI r2, 33
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
