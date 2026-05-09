; DESCRIPTION: Places a red 40x16 rectangle at position (129, 107).
; PLAN: r0=129(x), r1=107(y), r2=40(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 107
LDI r2, 40
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
