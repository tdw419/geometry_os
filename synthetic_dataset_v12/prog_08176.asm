; DESCRIPTION: Places a orange 107x59 rectangle at position (221, 174).
; PLAN: r0=221(x), r1=174(y), r2=107(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 174
LDI r2, 107
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
