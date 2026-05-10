; DESCRIPTION: Places a red 104x83 rectangle at position (365, 169).
; PLAN: r0=365(x), r1=169(y), r2=104(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 169
LDI r2, 104
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
