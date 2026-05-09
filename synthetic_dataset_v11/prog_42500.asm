; DESCRIPTION: Composite: . Then Places a red dot at position (41, 108). Then Creates a magenta rectangular region at (152, 133) spanning 42 by 45 pixels.
; PLAN: r0=41(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=152(x), r1=133(y), r2=42(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (41, 108).
; PLAN: r0=41(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (152, 133) spanning 42 by 45 pixels.
; PLAN: r0=152(x), r1=133(y), r2=42(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 133
LDI r2, 42
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
