; DESCRIPTION: Places a green 106x14 rectangle at position (365, 107).
; PLAN: r0=365(x), r1=107(y), r2=106(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 107
LDI r2, 106
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
