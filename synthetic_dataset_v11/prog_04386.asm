; DESCRIPTION: Places a orange 44x91 rectangle at position (33, 146).
; PLAN: r0=33(x), r1=146(y), r2=44(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 146
LDI r2, 44
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
