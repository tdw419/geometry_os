; DESCRIPTION: Places a red 36x55 rectangle at position (300, 174).
; PLAN: r0=300(x), r1=174(y), r2=36(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 174
LDI r2, 36
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
