; DESCRIPTION: Places a yellow 29x90 rectangle at position (180, 57).
; PLAN: r0=180(x), r1=57(y), r2=29(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 57
LDI r2, 29
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
