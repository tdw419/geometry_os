; DESCRIPTION: Creates a red rectangular region at (197, 44) spanning 109 by 59 pixels.
; PLAN: r0=197(x), r1=44(y), r2=109(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 44
LDI r2, 109
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
