; DESCRIPTION: Places a cyan 71x81 rectangle at position (185, 107).
; PLAN: r0=185(x), r1=107(y), r2=71(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 107
LDI r2, 71
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
