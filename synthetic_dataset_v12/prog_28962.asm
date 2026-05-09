; DESCRIPTION: Places a orange 91x25 rectangle at position (209, 180).
; PLAN: r0=209(x), r1=180(y), r2=91(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 180
LDI r2, 91
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
