; DESCRIPTION: Places a yellow 41x20 box at position (346, 190).
; PLAN: r0=346(x), r1=190(y), r2=41(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 190
LDI r2, 41
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
