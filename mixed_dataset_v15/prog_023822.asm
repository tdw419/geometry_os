; DESCRIPTION: Places a white 62x46 rectangle at position (443, 205).
; PLAN: r0=443(x), r1=205(y), r2=62(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 205
LDI r2, 62
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
