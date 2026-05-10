; DESCRIPTION: Places a orange 46x46 rectangle at position (204, 174).
; PLAN: r0=204(x), r1=174(y), r2=46(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 174
LDI r2, 46
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
