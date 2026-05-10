; DESCRIPTION: Places a cyan 46x41 box at position (330, 174).
; PLAN: r0=330(x), r1=174(y), r2=46(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 174
LDI r2, 46
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
