; DESCRIPTION : Draw s a g re en re ct angle of size 64 x 64 at the to p - left co r ne r ( 0 , 0 ) .

; P h as e 2 19 De mo : S cre en C a p t u re to RA M
; = = = = =
; Draw s 10 p i x el s ac ro s s the screen
; U se s PSET ( 0x2000 = x ) from screen ( 0x 00 00 00FF )
; 0x 00 = 0x00FF00 1 = 50
; 0x 1000 : screen base ( re d y counter )
; 0x 10 1 1 = RA M at 0x2000 ( n ul l co p i ed d p i x el s )
; 0x 2 100 - 0x2009 : RA M are a g a in color ( 0x 00 00 00FF )
; 0x 00 00 .. 0x 01 7 8 - 0x2009 FF p i x el s co p i ed d in ate s
; 0x 00 8 - V M d res s of screen p i x el s
; ── Con st an ts ──────────────────────────────────────
LDI r2, 0x2000 ; p i x el counter
LDI r13, 0x2000 ; p i x el color ( 0 , 0 )
LDI r12, 0x2000 ; p i x el s

COPY_LOOP:
LOAD