; DESCRIPTION: Places a green 97x47 rectangle at position (367, 164).
; PLAN: r0=367(x), r1=164(y), r2=97(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 164
LDI r2, 97
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
