; DESCRIPTION: Places a yellow 32x41 rectangle at position (245, 150).
; PLAN: r0=245(x), r1=150(y), r2=32(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 150
LDI r2, 32
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
