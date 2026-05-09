; DESCRIPTION: Places a black 55x46 rectangle at position (321, 50).
; PLAN: r0=321(x), r1=50(y), r2=55(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 50
LDI r2, 55
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
