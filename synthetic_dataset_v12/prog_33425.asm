; DESCRIPTION: Places a red 76x19 rectangle at position (130, 143).
; PLAN: r0=130(x), r1=143(y), r2=76(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 143
LDI r2, 76
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
