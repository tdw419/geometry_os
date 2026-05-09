; DESCRIPTION: Places a orange 98x19 rectangle at position (146, 80).
; PLAN: r0=146(x), r1=80(y), r2=98(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 80
LDI r2, 98
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
