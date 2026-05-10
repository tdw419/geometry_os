; DESCRIPTION: Places a red 94x17 rectangle at position (395, 38).
; PLAN: r0=395(x), r1=38(y), r2=94(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 38
LDI r2, 94
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
