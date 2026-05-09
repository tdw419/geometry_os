; DESCRIPTION: Places a orange 98x83 rectangle at position (146, 108).
; PLAN: r0=146(x), r1=108(y), r2=98(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 108
LDI r2, 98
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
