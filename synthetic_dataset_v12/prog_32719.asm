; DESCRIPTION: Places a yellow 100x46 rectangle at position (34, 174).
; PLAN: r0=34(x), r1=174(y), r2=100(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 174
LDI r2, 100
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
