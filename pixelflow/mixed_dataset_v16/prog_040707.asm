; DESCRIPTION: Places a cyan 46x90 rectangle at position (432, 43).
; PLAN: r0=432(x), r1=43(y), r2=46(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 43
LDI r2, 46
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
