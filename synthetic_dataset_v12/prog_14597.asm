; DESCRIPTION: Places a red 41x63 rectangle at position (167, 111).
; PLAN: r0=167(x), r1=111(y), r2=41(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 111
LDI r2, 41
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
