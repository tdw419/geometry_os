; DESCRIPTION: Places a green 79x93 rectangle at position (46, 47).
; PLAN: r0=46(x), r1=47(y), r2=79(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 47
LDI r2, 79
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
