; DESCRIPTION: Places a cyan 96x107 rectangle at position (208, 90).
; PLAN: r0=208(x), r1=90(y), r2=96(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 90
LDI r2, 96
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
