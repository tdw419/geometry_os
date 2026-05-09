; DESCRIPTION: Places a red 31x76 rectangle at position (340, 19).
; PLAN: r0=340(x), r1=19(y), r2=31(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 19
LDI r2, 31
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
