; DESCRIPTION: Places a yellow 44x41 rectangle at position (383, 186).
; PLAN: r0=383(x), r1=186(y), r2=44(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 186
LDI r2, 44
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
