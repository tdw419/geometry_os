; DESCRIPTION: Places a green 41x72 rectangle at position (92, 150).
; PLAN: r0=92(x), r1=150(y), r2=41(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 150
LDI r2, 41
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
