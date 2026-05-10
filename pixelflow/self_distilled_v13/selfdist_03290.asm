; DESCRIPTION: Places a white 50x39 box at position (392, 149).
; PLAN: r0=392(x), r1=149(y), r2=50(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 149
LDI r2, 50
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
