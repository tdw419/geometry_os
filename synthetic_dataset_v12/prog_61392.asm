; DESCRIPTION: Places a purple 50x77 rectangle at position (444, 150).
; PLAN: r0=444(x), r1=150(y), r2=50(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 150
LDI r2, 50
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
