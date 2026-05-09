; DESCRIPTION: Places a red 70x31 rectangle at position (302, 21).
; PLAN: r0=302(x), r1=21(y), r2=70(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 21
LDI r2, 70
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
