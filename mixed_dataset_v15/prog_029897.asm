; DESCRIPTION: Places a red 41x16 rectangle at position (262, 40).
; PLAN: r0=262(x), r1=40(y), r2=41(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 40
LDI r2, 41
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
