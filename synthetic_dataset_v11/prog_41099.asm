; DESCRIPTION: Places a cyan 41x26 rectangle at position (208, 177).
; PLAN: r0=208(x), r1=177(y), r2=41(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 177
LDI r2, 41
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
