; DESCRIPTION: Places a red 54x46 rectangle at position (409, 190).
; PLAN: r0=409(x), r1=190(y), r2=54(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 190
LDI r2, 54
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
