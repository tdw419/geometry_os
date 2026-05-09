; DESCRIPTION: Places a cyan 73x99 rectangle at position (25, 107).
; PLAN: r0=25(x), r1=107(y), r2=73(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 107
LDI r2, 73
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
