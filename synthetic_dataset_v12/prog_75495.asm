; DESCRIPTION: Places a yellow 75x45 rectangle at position (180, 36).
; PLAN: r0=180(x), r1=36(y), r2=75(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 36
LDI r2, 75
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
