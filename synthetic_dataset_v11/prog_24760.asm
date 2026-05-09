; DESCRIPTION: Places a yellow 61x25 rectangle at position (180, 79).
; PLAN: r0=180(x), r1=79(y), r2=61(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 79
LDI r2, 61
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
